using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SecurityFramework.Startup))]
namespace SecurityFramework
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
