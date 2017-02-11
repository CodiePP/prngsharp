using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Reflection;

namespace sharpPRNG
{
	public class MT19937 : IDisposable
	{
		[DllImport("prngCpp.dll", CharSet = CharSet.Ansi)]
		static extern IntPtr mk_mt19937 ();
		[DllImport("prngCpp.dll", CharSet = CharSet.Ansi)]
		static extern void del_ptr (IntPtr ptr);
		[DllImport("prngCpp.dll", CharSet = CharSet.Ansi)]
		static extern UInt32 get_uint32 (IntPtr prng);

		private IntPtr cptr { get; set; } = IntPtr.Zero;

		public MT19937 ()
		{
			// initialize external mt19937 prng
			cptr = mk_mt19937();
/*
			// check linked assemblies
			AppDomain ad = AppDomain.CurrentDomain;
			foreach (Assembly a in ad.GetAssemblies()) {
				System.Console.WriteLine ("  loaded {0}", a.ToString ());
				foreach (FileStream str in a.GetFiles()) {
					System.Console.WriteLine ("    file {0}", str.Name);
				}
			} */
		}

		public void Dispose()
		{
			// deallocate external data
			if (cptr != IntPtr.Zero) {
				del_ptr (cptr);
			}
		} 

		public UInt32 get_uint32()
		{
			if (cptr != IntPtr.Zero) {
				return get_uint32 (cptr);
			} else {
				throw new ArgumentNullException ("Cptr is not available!");
			}
		}

		public float get_real(float max = 1.0f)
		{
			double t = (double)get_uint32 ();
			return (float)(t * (double)max / (double)UInt32.MaxValue);
		}

	}

}

