using AgdPersonal.Entities;
using AgdPersonal.Extensions;
using AgdPersonal.Models;
using Dapper;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace AgdPersonal.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            SqlConnection connection = new SqlConnection("server=.\\SQLExpress; database=AgdPersonDb; integrated security=true");

            var about = connection.QueryFirst<About>(sql: "select * from Abouts");
            var skills = connection.Query<Skill>(sql: "ap_ListSkill", commandType:System.Data.CommandType.StoredProcedure);

            var services = connection.Query<Service>(sql: "select * from Services");

            var serviceSlogan = connection.QuerySingle<Slogan>(sql: "ap_ListSlogan", param:new { @sectionName="Services" }, commandType: System.Data.CommandType.StoredProcedure);
            var skillSlogan = connection.QuerySingle<Slogan>(sql: "ap_ListSlogan", param: new { @sectionName = "Skills" }, commandType: System.Data.CommandType.StoredProcedure);


            var viewModel = new IndexViewModel();
            viewModel.About = about;
            viewModel.Skills = skills;
            viewModel.Services = services;
            viewModel.ServiceSlogan = serviceSlogan;
            viewModel.SkillSlogan= skillSlogan;

            return View(viewModel);

            //------------------------------------------------------------------------------
            // c# extension METHOD ÖĞRENMEK İÇİN YAZILMIŞTIR.. 2 ÖNEMLİ ŞART -> STATİC OLMALI THiS KULLAN // Olan methoda özellik kazandırmak için kullanılır
           
            
            //List<Skill> skills= new List<Skill>();
            //skills.AddDuplicate(new Skill() { Id = 1, Rate = 70, Title = "Bu kayıttan 2 tane olması lazım" });

            //List<About> abouts = new List<About>();
            //abouts.AddDuplicate(new About { Id = 1 });

            //var kayit = skills;
            //var kayit2 = abouts;

            //-------------------------------------------------------------------------------------//

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

            return View(about);
        }

        [HttpPost]
        public ActionResult Contact(Contact contact)
        {
            SqlConnection connection = new SqlConnection("server=.\\SQLExpress; database=AgdPersonDb; integrated security=true");

            var affectedRows = connection.Execute(sql: "ap_CreateContact", commandType: System.Data.CommandType.StoredProcedure, param: contact);

            return RedirectToAction("Index");

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