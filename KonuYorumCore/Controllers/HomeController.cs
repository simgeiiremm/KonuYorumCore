using KonuYorumCore.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace KonuYorumCore.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        //https://localhost:44331/Home/Index //program.cs altındaki route tanımı: controller/action/id?
        //https://localhost:44331/Home //route'da default action Index
        //https://localhost:44331 //route'da default controller tanımı Home, default action tanımı Index
        public IActionResult Index() //https://localhost:44331/Home/Index
        {
            return View();
        }
        
        public IActionResult Privacy() //https://localhost:44331/Home/Privacy
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error() //https://localhost:44331/Home/Error
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}