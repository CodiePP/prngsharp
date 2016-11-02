using System;
using sharpPRNG;

namespace testSharpPRNG
{
	class MainClass
	{
		public static String Hashes(float n0)
		{
			int n = (int)(n0 + 0.5f);
			return new String ('#', n);
		}

		public static String Align(String s0, int len)
		{
			return (s0 + new String (' ', len)).Substring (0, len);
		}

		public static void Main (string[] args)
		{
			using (MT19937 prng = new MT19937 ()) {
				for (var i = 0; i < 20; i++) {
					var f = prng.get_real (30.0f);
					Console.WriteLine ($"{Align(i.ToString(), 3)} {Align(Hashes(f),30)}  rs =  {Align(f.ToString(), 10)} / {prng.get_uint32()}");
				}
			}
		}
	}
}
