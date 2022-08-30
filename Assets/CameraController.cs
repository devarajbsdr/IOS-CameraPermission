using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CameraController : MonoBehaviour {

	public Text textUI;
	// Use this for initialization
	void Start () {
		//StartCoroutine (CheckPrefs ());
	}
	
	// Update is called once per frame
	void Update () {
		
	}
		

	public void Test()
	{
		iOSNative.CameraAccess ();

	}

	#if UNITY_IOS
	void cameraCheck(string value)
	{
		// DO SOMETHING WITH VALUE

		if (value == "YES") {
			textUI.text = "Permission granted **";
		} else 
		{
			textUI.text = "Permission denied **";
		}
	}
	#endif
}
