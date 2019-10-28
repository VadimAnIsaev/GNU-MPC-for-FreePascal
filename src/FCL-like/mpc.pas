{
    This file is header translation the GNU Multiple Precision 
    Complex Library for FreePascal.
    Copyright (c) 2019 by Vadim Isaev
    
    See the file COPYING.FPC, included in this distribution,
    for details about the copyright. (LGPL)

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}

unit mpc;
{$mode objfpc}{$h+}
{$packrecords c}

Interface

Uses gmp, mpfr;

Const
  
  LIBMPC = 'mpc';

Const
  // Константы типов округления
  MPC_RNDNN = Integer(MPFR_RNDN) + (Integer(MPFR_RNDN) shl 4);
  MPC_RNDNZ = Integer(MPFR_RNDN) + (Integer(MPFR_RNDZ) shl 4);
  MPC_RNDNU = Integer(MPFR_RNDN) + (Integer(MPFR_RNDU) shl 4);
  MPC_RNDND = Integer(MPFR_RNDN) + (Integer(MPFR_RNDD) shl 4);

  MPC_RNDZN = Integer(MPFR_RNDZ) + (Integer(MPFR_RNDN) shl 4);
  MPC_RNDZZ = Integer(MPFR_RNDZ) + (Integer(MPFR_RNDZ) shl 4);
  MPC_RNDZU = Integer(MPFR_RNDZ) + (Integer(MPFR_RNDU) shl 4);
  MPC_RNDZD = Integer(MPFR_RNDZ) + (Integer(MPFR_RNDD) shl 4);

  MPC_RNDUN = Integer(MPFR_RNDU) + (Integer(MPFR_RNDN) shl 4);
  MPC_RNDUZ = Integer(MPFR_RNDU) + (Integer(MPFR_RNDZ) shl 4);
  MPC_RNDUU = Integer(MPFR_RNDU) + (Integer(MPFR_RNDU) shl 4);
  MPC_RNDUD = Integer(MPFR_RNDU) + (Integer(MPFR_RNDD) shl 4);

  MPC_RNDDN = Integer(MPFR_RNDD) + (Integer(MPFR_RNDN) shl 4);
  MPC_RNDDZ = Integer(MPFR_RNDD) + (Integer(MPFR_RNDZ) shl 4);
  MPC_RNDDU = Integer(MPFR_RNDD) + (Integer(MPFR_RNDU) shl 4);
  MPC_RNDDD = Integer(MPFR_RNDD) + (Integer(MPFR_RNDD) shl 4);


Type
  mpc_t = packed record
    re: mpfr_t;
    im: mpfr_t;
  end;
  mpc_ptr = ^mpc_t;

  mpc_rnd_t = integer;

procedure  mpc_init2     (var rop: mpc_t; p1: mpfr_prec_t); cdecl; external LIBMPC name 'mpc_init2';
procedure  mpc_init3     (var rop: mpc_t; p1: mpfr_prec_t; p2: mpfr_prec_t); cdecl; external LIBMPC name 'mpc_init3';
procedure  mpc_clear     (var rop: mpc_t); cdecl; external LIBMPC name 'mpc_clear';

function   mpc_add       (var rop: mpc_t; var p1: mpc_t; var p2: mpc_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_add';
function   mpc_add_fr    (var rop: mpc_t; var p1: mpc_t; var p2: mpfr_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_add_fr';
function   mpc_add_si    (var rop: mpc_t; var p1: mpc_t; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_add_si';
function   mpc_add_ui    (var rop: mpc_t; var p1: mpc_t; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_add_ui';

function   mpc_sub       (var rop: mpc_t; var p1: mpc_t; var p2: mpc_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sub';
function   mpc_sub_fr    (var rop: mpc_t; var p1: mpc_t; var p2: mpfr_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sub_fr';
function   mpc_fr_sub    (var rop: mpc_t; var p1: mpfr_t; var p2: mpc_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_fr_sub';
function   mpc_sub_ui    (var rop: mpc_t; var p1: mpc_t; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sub_ui';
function   mpc_ui_ui_sub (var rop: mpc_t; p1: DWord; p2: DWord; var p3: mpc_t; p4: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_ui_ui_sub';

function   mpc_mul       (var rop: mpc_t; var p1: mpc_t; var p2: mpc_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul';
function   mpc_mul_fr    (var rop: mpc_t; var p1: mpc_t; var p2: mpfr_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_fr';
function   mpc_mul_ui    (var rop: mpc_t; var p1: mpc_t; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_ui';
function   mpc_mul_si    (var rop: mpc_t; var p1: mpc_t; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_si';
function   mpc_mul_i     (var rop: mpc_t; var p1: mpc_t; p2: integer; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_i';
function   mpc_mul_2ui   (var rop: mpc_t; var p1: mpc_t; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_2ui';
function   mpc_mul_2si   (var rop: mpc_t; var p1: mpc_t; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_2si';

function   mpc_div       (var rop: mpc_t; var p1: mpc_t; var p2: mpc_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div';
function   mpc_div_fr    (var rop: mpc_t; var p1: mpc_t; var p2: mpfr_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div_fr';
function   mpc_fr_div    (var rop: mpc_t; var p1: mpfr_t; var p2: mpc_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_fr_div';
function   mpc_div_ui    (var rop: mpc_t; var p1: mpc_t; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div_ui';
function   mpc_ui_div    (var rop: mpc_t; p1: DWord; var p2: mpc_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_ui_div';
function   mpc_div_2ui   (var rop: mpc_t; var p1: mpc_t; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div_2ui';
function   mpc_div_2si   (var rop: mpc_t; var p1: mpc_t; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div_2si';

function   mpc_sqr       (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sqr';
function   mpc_pow       (var rop: mpc_t; var p1: mpc_t; var p2: mpc_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow';
function   mpc_pow_fr    (var rop: mpc_t; var p1: mpc_t; var p2: mpfr_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_fr';
function   mpc_pow_ld    (var rop: mpc_t; var p1: mpc_t; p2: extended; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_ld';
function   mpc_pow_d     (var rop: mpc_t; var p1: mpc_t; p2: double; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_d';
function   mpc_pow_si    (var rop: mpc_t; var p1: mpc_t; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_si';
function   mpc_pow_ui    (var rop: mpc_t; var p1: mpc_t; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_ui';
function   mpc_pow_z     (var rop: mpc_t; var p1: mpc_t; var p2: mpz_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_z';
function   mpc_conj      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_conj';
function   mpc_neg       (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_neg';
function   mpc_norm      (var rop: mpfr_t; var p1: mpc_t; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_norm';
function   mpc_abs       (var rop: mpfr_t; var p1: mpc_t; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_abs';
function   mpc_sqrt      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sqrt';

function   mpc_set       (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set';
function   mpc_set_d     (var rop: mpc_t; p1: double; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_d';
function   mpc_set_d_d   (var rop: mpc_t; p1: double; p2: double; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_d_d';
function   mpc_set_ld    (var rop: mpc_t; p1: extended; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_ld';
function   mpc_set_ld_ld (var rop: mpc_t; p1: extended; p2: extended; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_ld_ld';
function   mpc_set_f     (var rop: mpc_t; var p1: mpf_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_f';
function   mpc_set_f_f   (var rop: mpc_t; var p1: mpf_t; var p2: mpf_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_f_f';
function   mpc_set_fr    (var rop: mpc_t; var p1: mpfr_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_fr';
function   mpc_set_fr_fr (var rop: mpc_t; var p1: mpfr_t; var p2: mpfr_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_fr_fr';
function   mpc_set_q     (var rop: mpc_t; var p1: mpq_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_q';
function   mpc_set_q_q   (var rop: mpc_t; var p1: mpq_t; var p2: mpq_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_q_q';
function   mpc_set_si    (var rop: mpc_t; p1: longint; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_si';
function   mpc_set_si_si (var rop: mpc_t; p1: longint; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_si_si';
function   mpc_set_ui    (var rop: mpc_t; p1: DWord; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_ui';
function   mpc_set_ui_ui (var rop: mpc_t; p1: DWord; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_ui_ui';
function   mpc_set_z     (var rop: mpc_t; var p1: mpz_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_z';
function   mpc_set_z_z   (var rop: mpc_t; var p1: mpz_t; var p2: mpz_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_z_z';
procedure  mpc_set_nan   (var rop: mpc_t); cdecl; external LIBMPC name 'mpc_set_nan';
procedure  mpc_swap      (var rop: mpc_t; var p1: mpc_t); cdecl; external LIBMPC name 'mpc_swap';

function   mpc_fma       (var rop: mpc_t; var p1: mpc_t; var p2: mpc_t; var p3: mpc_t; p4: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_fma';
function   mpc_real      (rop: mpfr_ptr; var p1: mpc_t; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_real';
function   mpc_imag      (rop: mpfr_ptr; var p1: mpc_t; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_imag';
function   mpc_arg       (rop: mpfr_ptr; var p1: mpc_t; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_arg';
function   mpc_proj      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_proj';

function   mpc_cmp       (var op1: mpc_t; var op2: mpc_t): integer; cdecl; external LIBMPC name 'mpc_cmp';
function   mpc_cmp_si    (op1: mpc_t; op2: longint): integer;
function   mpc_cmp_si_si (var op1: mpc_t; op2: longint; op3: longint): integer; cdecl; external LIBMPC name 'mpc_cmp_si_si';
function   mpc_cmp_abs   (var op1: mpc_t; var op2: mpc_t): integer; cdecl; external LIBMPC name 'mpc_cmp_abs';

function   mpc_exp       (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_exp';
function   mpc_log       (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_log';
function   mpc_log10     (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_log10';
function   mpc_sin       (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sin';
function   mpc_cos       (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_cos';
function   mpc_sin_cos   (var rop1: mpc_t; var rop2: mpc_t; var p1: mpc_t; p2: mpc_rnd_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sin_cos';
function   mpc_tan       (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_tan';
function   mpc_sinh      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sinh';
function   mpc_cosh      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_cosh';
function   mpc_tanh      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_tanh';
function   mpc_asin      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_asin';
function   mpc_acos      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_acos';
function   mpc_atan      (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_atan';
function   mpc_asinh     (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_asinh';
function   mpc_acosh     (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_acosh';
function   mpc_atanh     (var rop: mpc_t; var p1: mpc_t; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_atanh';

function   mpc_rootofunity (var rop: mpc_t; p1: DWord; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_rootofunity';

function   mpc_urandom     (var rop: mpc_t; p1: randstate_t): integer; cdecl; external LIBMPC name 'mpc_urandom';
function   mpc_get_prec    (var rop: mpc_t): mpfr_prec_t; cdecl; external LIBMPC name 'mpc_get_prec';
procedure  mpc_get_prec2   (var rop: mpfr_prec_t; p1: mpfr_prec_t; var p2: mpc_t); cdecl; external LIBMPC name 'mpc_get_prec2';
procedure  mpc_set_prec    (var rop: mpc_t; p1: mpfr_prec_t); cdecl; external LIBMPC name 'mpc_set_prec';
function   mpc_get_version (): PChar; cdecl; external LIBMPC name 'mpc_get_version';
function   mpc_strtoc      (var rop: mpc_t; const p1: PChar; p2: PPChar; p3: integer; p4: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_strtoc';
function   mpc_set_str     (var rop: mpc_t; const p1: PChar; p2: integer; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_str';
function   mpc_get_str     (rop: integer; p1: valuint; var p2: mpc_t; p3: mpc_rnd_t): PChar; cdecl; external LIBMPC name 'mpc_get_str';
procedure  mpc_free_str    (rop: PChar); cdecl; external LIBMPC name 'mpc_free_str';

function mpc_realref(op: mpc_t): mpfr_t;
function mpc_imagref(op: mpc_t): mpfr_t;


// Результат округления
// Возвращаемое значение:
//	= 0 - округление точное;
//	< 0 - округление меньше точного;
//	> 0 - округление больше точного.

// Transform negative to 2, positive to 1, leave 0 unchanged
function MPC_INEX_POS(inex: integer): integer;
// Transform 2 to negative, 1 to positive, leave 0 unchanged 
function MPC_INEX_NEG(inex: integer): integer;

function MPC_INEX(inex_re, inex_im: integer): integer;


// Для функций возвращающих два результата
function MPC_INEX12(inex1, inex2: integer): integer;
function MPC_INEX1(inex: integer): integer; 
function MPC_INEX2(inex: integer): integer;

// Отдельно для реального и мнимого составляющего
function MPC_INEX_RE(inex: integer): integer;
function MPC_INEX_IM(inex: integer): integer;

// Вычисление типов округления
function MPC_RND(r1, r2: mpfr_rnd_t): mpc_rnd_t;
function MPC_RND_RE(x: mpc_rnd_t): mpfr_rnd_t; 
function MPC_RND_IM(x: mpc_rnd_t): mpfr_rnd_t;


Implementation

function mpc_realref(op: mpc_t): mpfr_t;
begin
  Result:=op.re;
end;

function mpc_imagref(op: mpc_t): mpfr_t;
begin
  Result:=op.im;
end;

function mpc_cmp_si(op1: mpc_t; op2: longint): integer;
begin
  Result:=mpc_cmp_si_si(op1, op2, 0);
end;

function MPC_INEX_POS(inex: integer): integer; 
begin
  If inex < 0 Then 
    Result:=2 
  Else If inex = 0 Then 
         Result:=0 
       Else
         Result:=1;
end;

function MPC_INEX_NEG(inex: integer): integer; 
begin
  If inex = 2 Then 
    Result:= -1 
  Else If inex = 0 Then 
         Result:= 0 
       Else 
         Result:=1;
end;

function MPC_INEX(inex_re, inex_im: integer): integer;
begin
  Result:=MPC_INEX_POS(inex_re) or (MPC_INEX_POS(inex_im) shl 2)
end;

function MPC_INEX12(inex1, inex2: integer): integer;
begin
  Result := inex1 or (inex2 shl 4)
end;

function MPC_INEX1(inex: integer): integer; 
begin
  Result:=inex and 15;
end;

function MPC_INEX2(inex: integer): integer;
begin
  Result:=inex shr 4;
end;

function MPC_INEX_RE(inex: integer): integer;
begin
  Result:=MPC_INEX_NEG(inex and 3)
end;

function MPC_INEX_IM(inex: integer): integer;
begin
  Result:=MPC_INEX_NEG(inex shr 2)
end;

function MPC_RND(r1, r2: mpfr_rnd_t): mpc_rnd_t;
begin
  Result:=Integer(r1) + (Integer(r2) shl 4);
end;

function MPC_RND_RE(x: mpc_rnd_t): mpfr_rnd_t; 
begin
  Result:=mpfr_rnd_t(Integer(x) and $0F);
end;

function MPC_RND_IM(x: mpc_rnd_t): mpfr_rnd_t;
begin
  Result:=mpfr_rnd_t(Integer(x) shr 4);
end;

end.
