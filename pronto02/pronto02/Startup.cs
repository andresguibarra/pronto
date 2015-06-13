using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(pronto02.Startup))]
namespace pronto02
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
