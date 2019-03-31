using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class CountDown
{
    private TimeSpan timeSpan;

    public CountDown(TimeSpan timeSpan)
    {
        // TODO: Complete member initialization
        this.timeSpan = timeSpan;
    }
    public TimeSpan TimeLeft { get; set; }

    public void Start()
    {
        //throw new NotImplementedException();
    }

    
}
