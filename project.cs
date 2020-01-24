using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
   public class project
    {
        public int projectID { get; set; }
        public int uID { get; set; }
        public string content { get; set; }
        public string projectImg { get; set; }
        public double money { get; set; }
        public double getedMoney { get; set; }
        public DateTime beginTime { get; set; }
        public DateTime endTime { get; set; }
        public string position { get; set; }
        public int heart { get; set; }
        public int huiBaoID { get; set; }
        public string State { get; set; } 
        public int people { get; set; } 
        public int typeID { get; set; } 
        public string proJJ { get; set; }
        public string proXQ { get; set; }
        public string JD { get; set; }

    }
}
