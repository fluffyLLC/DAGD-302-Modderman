using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LerpMe : MonoBehaviour
{

    public Transform pozA;
    public Transform pozB;
    [Range(0,1)]
    public float p;

    /// <summary>
    /// How long should we take to animate
    /// </summary>
    public float BigTime = 2;
    /// <summary>
    /// Modified by deltatime to calculate time passage
    /// </summary>
    float LittleTime = 0;
    bool IsPlayingForward = true;

    public bool UseAnimTime = true;

    public AnimationCurve DaddysBigCurve;

    Vector3 EaseTarget;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

        EaseTarget = CalcPosition();

        transform.position = AnimMath.Dampen(transform.position, EaseTarget, .05f);



        
        if (IsPlayingForward)
        {
            LittleTime += Time.deltaTime;
            if (LittleTime >= BigTime) IsPlayingForward = false;
        }
        else {

            LittleTime -= Time.deltaTime;
            if (LittleTime <= 0) IsPlayingForward = true;
        }

        //CalcPosition();
        
    }

    void OnValidate() {
        CalcPosition();
    }

    Vector3 CalcPosition() {
        if (pozA == null || pozB == null) return Vector3.zero;
        p = LittleTime / BigTime;

        float tp = DaddysBigCurve.Evaluate(p);

        /*transform.position*/ return AnimMath.Lerp(pozA.position, pozB.position, tp);

    }

    void OnDrawGizmos() {
        Gizmos.DrawSphere(EaseTarget,.5f);

    }
}
