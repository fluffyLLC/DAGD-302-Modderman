using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimMath {


    public static float Lerp(float min,float max, float p) {
        return (max - min) * p + min;
    }


    public static Vector3 Lerp(Vector3 min, Vector3 max, float p)
    {
        return (max - min) * p + min;
    }

    public static float Smooth(float min, float max, float p) {
        p = p * p * (3 - 2 * p);

        return (max - min) * p + min;
    }

    public static float Dampen(float current, float target, float percentAfter1Second) {
        return Lerp(current, target, 1 - Mathf.Pow(percentAfter1Second, Time.deltaTime));
    }

    public static Vector3 Dampen(Vector3 current, Vector3 target, float percentAfter1Second)
    {
        return Lerp(current, target, 1 - Mathf.Pow(percentAfter1Second, Time.deltaTime));
    }

}
