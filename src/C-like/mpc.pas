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

procedure  mpc_init2     (rop: mpc_ptr; p1: mpfr_prec_t); cdecl; external LIBMPC name 'mpc_init2';
procedure  mpc_init3     (rop: mpc_ptr; p1: mpfr_prec_t; p2: mpfr_prec_t); cdecl; external LIBMPC name 'mpc_init3';
procedure  mpc_clear     (rop: mpc_ptr); cdecl; external LIBMPC name 'mpc_clear';

function   mpc_add       (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpc_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_add';
function   mpc_add_fr    (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpfr_srcptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_add_fr';
function   mpc_add_si    (rop: mpc_ptr; const p1: mpc_ptr; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_add_si';
function   mpc_add_ui    (rop: mpc_ptr; const p1: mpc_ptr; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_add_ui';

function   mpc_sub       (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpc_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sub';
function   mpc_sub_fr    (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpfr_srcptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sub_fr';
function   mpc_fr_sub    (rop: mpc_ptr; const p1: mpfr_srcptr; const p2: mpc_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_fr_sub';
function   mpc_sub_ui    (rop: mpc_ptr; const p1: mpc_ptr; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sub_ui';
function   mpc_ui_ui_sub (rop: mpc_ptr; p1: DWord; p2: DWord; const p3: mpc_ptr; p4: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_ui_ui_sub';

function   mpc_mul       (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpc_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul';
function   mpc_mul_fr    (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpfr_srcptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_fr';
function   mpc_mul_ui    (rop: mpc_ptr; const p1: mpc_ptr; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_ui';
function   mpc_mul_si    (rop: mpc_ptr; const p1: mpc_ptr; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_si';
function   mpc_mul_i     (rop: mpc_ptr; const p1: mpc_ptr; p2: integer; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_i';
function   mpc_mul_2ui   (rop: mpc_ptr; const p1: mpc_ptr; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_2ui';
function   mpc_mul_2si   (rop: mpc_ptr; const p1: mpc_ptr; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_mul_2si';

function   mpc_div       (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpc_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div';
function   mpc_div_fr    (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpfr_srcptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div_fr';
function   mpc_fr_div    (rop: mpc_ptr; const p1: mpfr_srcptr; const p2: mpc_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_fr_div';
function   mpc_div_ui    (rop: mpc_ptr; const p1: mpc_ptr; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div_ui';
function   mpc_ui_div    (rop: mpc_ptr; p1: DWord; const p2: mpc_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_ui_div';
function   mpc_div_2ui   (rop: mpc_ptr; const p1: mpc_ptr; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div_2ui';
function   mpc_div_2si   (rop: mpc_ptr; const p1: mpc_ptr; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_div_2si';

function   mpc_sqr       (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sqr';
function   mpc_pow       (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpc_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow';
function   mpc_pow_fr    (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpfr_srcptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_fr';
function   mpc_pow_ld    (rop: mpc_ptr; const p1: mpc_ptr; p2: extended; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_ld';
function   mpc_pow_d     (rop: mpc_ptr; const p1: mpc_ptr; p2: double; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_d';
function   mpc_pow_si    (rop: mpc_ptr; const p1: mpc_ptr; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_si';
function   mpc_pow_ui    (rop: mpc_ptr; const p1: mpc_ptr; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_ui';
function   mpc_pow_z     (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpz_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_pow_z';
function   mpc_conj      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_conj';
function   mpc_neg       (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_neg';
function   mpc_norm      (rop: mpfr_ptr; const p1: mpc_ptr; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_norm';
function   mpc_abs       (rop: mpfr_ptr; const p1: mpc_ptr; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_abs';
function   mpc_sqrt      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sqrt';

function   mpc_set       (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set';
function   mpc_set_d     (rop: mpc_ptr; p1: double; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_d';
function   mpc_set_d_d   (rop: mpc_ptr; p1: double; p2: double; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_d_d';
function   mpc_set_ld    (rop: mpc_ptr; p1: extended; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_ld';
function   mpc_set_ld_ld (rop: mpc_ptr; p1: extended; p2: extended; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_ld_ld';
function   mpc_set_f     (rop: mpc_ptr; const p1: mpf_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_f';
function   mpc_set_f_f   (rop: mpc_ptr; const p1: mpf_ptr; const p2: mpf_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_f_f';
function   mpc_set_fr    (rop: mpc_ptr; const p1: mpfr_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_fr';
function   mpc_set_fr_fr (rop: mpc_ptr; const p1: mpfr_ptr; const p2: mpfr_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_fr_fr';
function   mpc_set_q     (rop: mpc_ptr; const p1: mpq_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_q';
function   mpc_set_q_q   (rop: mpc_ptr; const p1: mpq_ptr; const p2: mpq_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_q_q';
function   mpc_set_si    (rop: mpc_ptr; p1: longint; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_si';
function   mpc_set_si_si (rop: mpc_ptr; p1: longint; p2: longint; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_si_si';
function   mpc_set_ui    (rop: mpc_ptr; p1: DWord; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_ui';
function   mpc_set_ui_ui (rop: mpc_ptr; p1: DWord; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_ui_ui';
function   mpc_set_z     (rop: mpc_ptr; const p1: mpz_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_z';
function   mpc_set_z_z   (rop: mpc_ptr; const p1: mpz_ptr; const p2: mpz_ptr; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_z_z';
procedure  mpc_set_nan   (rop: mpc_ptr); cdecl; external LIBMPC name 'mpc_set_nan';
procedure  mpc_swap      (rop: mpc_ptr; p1: mpc_ptr); cdecl; external LIBMPC name 'mpc_swap';

function   mpc_fma       (rop: mpc_ptr; const p1: mpc_ptr; const p2: mpc_ptr; const p3: mpc_ptr; p4: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_fma';
function   mpc_real      (rop: mpfr_ptr; const p1: mpc_ptr; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_real';
function   mpc_imag      (rop: mpfr_ptr; const p1: mpc_ptr; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_imag';
function   mpc_arg       (rop: mpfr_ptr; const p1: mpc_ptr; p2: mpfr_rnd_t): integer; cdecl; external LIBMPC name 'mpc_arg';
function   mpc_proj      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_proj';

function   mpc_cmp       (const op1: mpc_ptr; const op2: mpc_ptr): integer; cdecl; external LIBMPC name 'mpc_cmp';
function   mpc_cmp_si    (const op1: mpc_ptr; op2: longint): integer;
function   mpc_cmp_si_si (const op1: mpc_ptr; op2: longint; op3: longint): integer; cdecl; external LIBMPC name 'mpc_cmp_si_si';
function   mpc_cmp_abs   (const op1: mpc_ptr; const op2: mpc_ptr): integer; cdecl; external LIBMPC name 'mpc_cmp_abs';

function   mpc_exp       (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_exp';
function   mpc_log       (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_log';
function   mpc_log10     (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_log10';
function   mpc_sin       (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sin';
function   mpc_cos       (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_cos';
function   mpc_sin_cos   (rop1: mpc_ptr; rop2: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sin_cos';
function   mpc_tan       (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_tan';
function   mpc_sinh      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_sinh';
function   mpc_cosh      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_cosh';
function   mpc_tanh      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_tanh';
function   mpc_asin      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_asin';
function   mpc_acos      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_acos';
function   mpc_atan      (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_atan';
function   mpc_asinh     (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_asinh';
function   mpc_acosh     (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_acosh';
function   mpc_atanh     (rop: mpc_ptr; const p1: mpc_ptr; p2: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_atanh';

function   mpc_rootofunity (rop: mpc_ptr; p1: DWord; p2: DWord; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_rootofunity';

function   mpc_urandom     (rop: mpc_ptr; p1: gmp_randstate_t): integer; cdecl; external LIBMPC name 'mpc_urandom';
function   mpc_get_prec    (const rop: mpc_ptr): mpfr_prec_t; cdecl; external LIBMPC name 'mpc_get_prec';
procedure  mpc_get_prec2   (var rop: mpfr_prec_t; var p1: mpfr_prec_t; const p2: mpc_ptr); cdecl; external LIBMPC name 'mpc_get_prec2';
procedure  mpc_set_prec    (rop: mpc_ptr; p1: mpfr_prec_t); cdecl; external LIBMPC name 'mpc_set_prec';
function   mpc_get_version (): PChar; cdecl; external LIBMPC name 'mpc_get_version';
function   mpc_strtoc      (rop: mpc_ptr; const p1: PChar; p2: PPChar; p3: integer; p4: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_strtoc';
function   mpc_set_str     (rop: mpc_ptr; const p1: PChar; p2: integer; p3: mpc_rnd_t): integer; cdecl; external LIBMPC name 'mpc_set_str';
function   mpc_get_str     (rop: integer; p1: valuint; const p2: mpc_ptr; p3: mpc_rnd_t): PChar; cdecl; external LIBMPC name 'mpc_get_str';
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

function mpc_cmp_si(const op1: mpc_ptr; op2: longint): integer;
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
