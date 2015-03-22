(
SynthDef(\helpStkbowed,{arg out=0,freq=220,gate=1,amp=1;
	var sig;
	//sig = StkInst.ar(Stk.at("Bowed"),freq, gate, amp, 0.5)*env;
	sig = StkBowedI.ar([freq,freq*1.5],gate,amp,0.5,64,17,50,1,64);
	Out.ar(out, sig.dup);
}).add;
)

(
SynthDef(\helpMandolin,{arg out=0,freq=220,gate=1,amp=1;
	var  sig;
	StkGlobals.ar(1,1,"C:/SupercolliderRepos/Mios/stk-4.5.0/stk-4.5.0/rawwaves/");
	sig = StkInst.ar(Stk.at("Mandolin"),freq, gate, amp, 0.5)*env;
	Out.ar(out, sig.dup);
}).add;
)

x = Synth(\helpStkbowed,[\freq, 300, \gate, 1,\amp,0.8]);
x = Synth(\helpMandolin,[\freq, 300, \gate, 1,\amp,0.8]);
x.release;
x.free;

