using AgdPersonal.Entities;
using Dapper;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace AgdPersonal.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            SqlConnection connection = new SqlConnection("server=.\\SQLExpress; database=AgdPersonDb; integrated security=true");

            var data = connection.QueryFirst<About>(sql: "select * from Abouts");


            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection=connection;
            //cmd.CommandType= System.Data.CommandType.Text;
            //cmd.CommandText = "select * from About where Id=1";
            //connection.Open();
            //var reader = cmd.ExecuteReader();

            //About about =new About();

            //while(reader.Read())
            //{
            //    about.Id = reader.GetInt32(0);
            //    about.Fullname= reader.GetString(1);
            //    about.JobTitle= reader.GetString(2);
            //    about.Description= reader.GetString(3);
            //    about.ImagePath= reader.GetString(4);
            //}
            //connection.Close();
            //reader.Close();

            return View(data);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }


        public ActionResult Portfolio()
        {
            SqlConnection connection = new SqlConnection("server=.\\SQLExpress; database=AgdPersonDb; integrated security=true");
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "ap_ListSlogan";
            cmd.Parameters.Add("@sectionName", "Skills");
            connection.Open();
            var reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                var title = reader.GetString(2);
                var description = reader.GetString(3);

            }
            connection.Close();
            reader.Close();
            return  View();

           
        }

        public ActionResult Contact()
        {
            return View();


        }
    }
}