using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EIA_CarbonFootprintCalculator.Startup))]
namespace EIA_CarbonFootprintCalculator
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
