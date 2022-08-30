using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;

// All Objective-C exposed methods should be bound here
public class AppControllerBinding
{


	[DllImport("__Internal")]
	private static extern void camera_permission();

	public static void CameraAccess()
	{
		// Call plugin only when running on real device
		//if( Application.platform == RuntimePlatform.IPhonePlayer )
		camera_permission();
	}

}
