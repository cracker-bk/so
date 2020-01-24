using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
namespace BLL
{
   public class myZCmanBLL
    {
        public static bool InsertmyZCman(myZCman cman)
        {
            return myZCmanDAL.InsertmyZCman(cman);
        }
        }
}
