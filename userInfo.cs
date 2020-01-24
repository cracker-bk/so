using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
   public class userInfo
    {
        public userInfo() {
            u = new users();
        }
        public int infoID { get; set; }
        public int uID { get; set; }
        public string address { get; set; }
        public string accountName { get; set; }
        public string bankType { get; set; }
        public string accountNum { get; set; }
        public string sex { get; set; }
        public DateTime resigterTime { get; set; }
        public string userImg { get; set; }
        public string IDNum { get; set; }
        public users u { get; set; }
    }
}
