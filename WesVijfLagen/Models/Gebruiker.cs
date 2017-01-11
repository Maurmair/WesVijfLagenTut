using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WesVijfLagen.Models
{
    public partial class Gebruiker
    {
        public void GeoCacheGevonden(string locatie)
        {
            using (TestModelContainer context = new TestModelContainer())
            {
                IQueryable<GeoCache> GeoCaches = context.GeoCacheSet;
                GeoCache[] geoArray = (
                    from g in GeoCaches
                    where g.Locatie == locatie
                    select g).ToArray();
                
                if (geoArray.Length > 0)
                {
                    context.GeoCacheSet.Add(geoArray[0]);
                    context.SaveChanges();
                }
                else
                {
                    new Exception("Locatie niet gevonden");
                }
            }
        }
    }
    
}