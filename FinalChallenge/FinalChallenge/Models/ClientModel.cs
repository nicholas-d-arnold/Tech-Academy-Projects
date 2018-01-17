using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalChallenge.Models
{
    public class ClientModel
    {
        public static List<Client> getClients()
        {

            List<Client> clients = new List<Client>
            {
                new Client { Name="John Smith", Address="254 Talcott Ave. Frostburg, MD 21532", Phone="301-697-3695"},
                new Client { Name="Michael Pickering", Address="1404 West Main St. Muncie, IN 47304", Phone="765-236-3365"},
                new Client { Name="Jennifer Townsend", Address="4000 SE Gladstone St. Portland, OR 97206", Phone="503-987-8780"},
                new Client { Name="Anna Hoyt", Address="900 South 900E Lafayette, IN 43200", Phone="778-553-1112"},
                new Client { Name="Bob Scott", Address="943 Chelan Dr. Sunnyvale, CA 90012", Phone="310-541-1991"},
                new Client { Name="Connie Longview", Address="22500 Skyview Dr. West Linn, OR 97068", Phone="503-997-3696"},
                new Client { Name="David Arnold", Address="PO Box 900 Denali Park, AK 99092", Phone="907-668-3444"},
                new Client { Name="James Harden", Address="23880 Prairie View Rd Houston, TX 34338", Phone="334-322-0988"},
                new Client { Name="Cindy Johnson", Address="1001 West University Ave. Memphis, TN 31045", Phone="223-999-1212"},
                new Client { Name="Damian McCollum", Address="12333 Skyline Dr. Portland, OR 97201", Phone="541-121-4448"},
                
                };
            return clients;
        }
    }

    public class Client
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
    }
}