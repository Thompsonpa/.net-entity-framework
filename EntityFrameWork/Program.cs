using EntityFrameWork.Entity;
using System;
using System.Linq;
using System.Text;

namespace EntityFrameWork
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new ExampleModelContainer())
            {

                //Get user from Entity FrameWork with linq
                Console.WriteLine("Get user information from Entity with Linq");
                Console.WriteLine("var query = db.users.Where(x => x.UserName == 'TestUser');");
                var query = db.users.Where(x => x.UserName == "TestUser");

                if (query == null) //Check to see if test user exits if it doesnt retrieve
                {
                    Console.WriteLine("test user does not exist add user...");

                    var user = new users(); // Create new User
                    user.UserName = "TestUser";
                    user.Address = "TestAddress";
                    user.Email = "Test@test.com";
                    user.Phone = "111-111-1111";
                    db.users.Add(user); // Add user to Entity

                    db.SaveChanges(); // Save changes to Entity and DB
                }
                else
                {
                    Console.WriteLine("user exists let get user information for test");
                }
                StringBuilder sb = new StringBuilder();
                foreach (users item in query)
                {                    
                    //Display user info via console
                    sb.AppendLine("UserName: " + item.UserName);
                    sb.AppendLine("Address: " + item.Address);
                    sb.AppendLine("Email: " + item.Email);
                    sb.AppendLine("Phone: " + item.Phone);                 
                }
                Console.WriteLine(sb.ToString());
                Console.WriteLine(" ");
                Console.WriteLine("Press enter to close console App");
                Console.Read();
            }
        }
    }
}
