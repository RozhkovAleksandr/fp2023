(** Copyright 2021-2023, RozhkovAleksandr *)

(** SPDX-License-Identifier: LGPL-3.0-or-later *)

type const =
  | Int of int (** int *)
  | Bool of bool (** bool *)
[@@deriving show { with_path = false }]

type pattern =
  | PConst of const (** const *)
  | PDash (** _ *)
  | PNill (** [] *)
  | PVar of string (** var -> ... *)
  | PCons of pattern * pattern (** x :: xs *)
[@@deriving show { with_path = false }]

type binop =
  | Plus (** + *)
  | Minus (** - *)
  | Equally (** == *)
  | NEqually (**<>*)
  | And (** && *)
  | Or (** || *)
  | Split (** / *)
  | Mult (** * *)
  | More (** > *)
  | MoEq (** >= *)
  | Less (** < *)
  | LeEq (** <= *)
[@@deriving show { with_path = false }]

type rec_flag =
  | Rec (** recursive *)
  | NoRec (** non recursive *)
[@@deriving show { with_path = false }]

type expr =
  | Var of string (** var *)
  | EConst of const (** const *)
  | EBinop of expr * binop * expr (** a + b *)
  | EIfThenElse of expr * expr * expr (** if then else*)
  | ELet of rec_flag * string * expr * expr (**let ... *)
  | EFun of pattern * expr (** fun *)
  | EApp of expr * expr (** f x *)
  | ETuple of expr list (** (1, 2) *)
  | EList of expr * expr (** [a; b; c], a :: [b; c]*)
  | Nil (** [] *)
  | EMatch of expr * (pattern * expr) list (** math ... with*)
[@@deriving show { with_path = false }]

type decl = rec_flag * string * expr [@@deriving show { with_path = false }]

type statement =
  | Decl of decl (** let ... *)
  | Expr of expr (** expression *)
[@@deriving show { with_path = false }]

type expressions = statement list [@@deriving show { with_path = false }]
