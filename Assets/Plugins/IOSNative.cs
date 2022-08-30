using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;
public class iOSNative{

	[DllImport("__Internal")]
	private static extern void camera_permission();

	public static void CameraAccess()
	{
		// Call plugin only when running on real device
		//if( Application.platform == RuntimePlatform.IPhonePlayer )
		camera_permission();
	}
}
