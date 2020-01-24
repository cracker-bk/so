using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class comment
    {
        public int commentID { get; set; }
        public int uID { get; set; }
        public string commentCtn { get; set; }
        public DateTime commentTime { get; set; }
        public int projectID { get; set; }
    }
}
