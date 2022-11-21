using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BookMyTickets
{
    public class DataBaseConnection
    {
        string ConString = System.Configuration.ConfigurationManager.ConnectionStrings["MovieTicketReservation"].ConnectionString;
        public DataTable GetDataFromTables(string query1)
        {
            DataTable FetchTable = new DataTable();
            try
            {
                OracleConnection Con = new OracleConnection(ConString);
                Oracle.ManagedDataAccess.Client.OracleCommand cmd = new Oracle.ManagedDataAccess.Client.OracleCommand();
                cmd.Connection = Con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query1;
                Con.Open();
                OracleDataAdapter reader = new OracleDataAdapter(cmd);
                reader.Fill(FetchTable);
                Con.Close();
            }
            catch (Exception e)
            {

            }
            return FetchTable;
        }

        public Boolean UpdateData(string Query1)
        {
            try
            {
                OracleTransaction Transaction;

                OracleConnection Con = new OracleConnection(ConString);
                Oracle.ManagedDataAccess.Client.OracleCommand cmd = new Oracle.ManagedDataAccess.Client.OracleCommand();
                cmd.Connection = Con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = Query1;
                Con.Open();
                Transaction = Con.BeginTransaction();
                cmd.Transaction = Transaction;
                cmd.ExecuteNonQuery();
                Transaction.Commit();
                Con.Close();
                return true;


            }
            catch (Exception ex)
            {

            }
            return false;
        }

        public Boolean RunSP(int bookingid, string name, int movieid, int noofseat, string seats, string moviename)
        {
            try
            {
                OracleTransaction Transaction;

                OracleConnection Con = new OracleConnection(ConString);
                Oracle.ManagedDataAccess.Client.OracleCommand cmd = new Oracle.ManagedDataAccess.Client.OracleCommand();
                cmd.Connection = Con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "BookingMovieRecords";

                cmd.Parameters.Add("BOOKINGID", OracleDbType.Int32).Value = bookingid;
                //cmd.Parameters.Add("BOOKEDUSERID", OracleDbType.NVarchar2).Value = BOOKEDUSERID;
                cmd.Parameters.Add("NAME", OracleDbType.NVarchar2).Value = name;
                cmd.Parameters.Add("MOVIEID", OracleDbType.Int32).Value = movieid;
                cmd.Parameters.Add("NUMBER_OF_SEAT", OracleDbType.Int32).Value = noofseat;
                cmd.Parameters.Add("SEATS", OracleDbType.NVarchar2).Value = seats;
                cmd.Parameters.Add("MOVIENAME", OracleDbType.NVarchar2).Value = moviename;

                Con.Open();
                Transaction = Con.BeginTransaction();
                cmd.Transaction = Transaction;
                cmd.ExecuteNonQuery();
                Transaction.Commit();
                Con.Close();
                return true;


            }
            catch (Exception ex)
            {

            }
            return false;
        }



        public Boolean Publish(int PGENREID, string PTITLE, string PDESCRIPTION, string PLANGUAGE, string PRELEASE_DATE, string PDIRECTOR, string PACTORF, string PACTORL, string PNATIONALITY, string PDOB, int PSTARS, int PMOVIEID, int PACTORID, int PRATINGID)
        {
            try
            {
                OracleTransaction Transaction;

                OracleConnection Con = new OracleConnection(ConString);
                Oracle.ManagedDataAccess.Client.OracleCommand cmd = new Oracle.ManagedDataAccess.Client.OracleCommand();
                cmd.Connection = Con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsertUsingPortal";

                cmd.Parameters.Add("PGENREID", OracleDbType.Int32).Value = PGENREID;
                cmd.Parameters.Add("PTITLE", OracleDbType.NVarchar2).Value = PTITLE;
                cmd.Parameters.Add("PDESCRIPTION", OracleDbType.NVarchar2).Value = PDESCRIPTION;
                cmd.Parameters.Add("PLANGUAGE", OracleDbType.NVarchar2).Value = PLANGUAGE;
                cmd.Parameters.Add("PRELEASE_DATE", OracleDbType.NVarchar2).Value = PRELEASE_DATE;
                cmd.Parameters.Add("PDIRECTOR", OracleDbType.NVarchar2).Value = PDIRECTOR;
                cmd.Parameters.Add("PACTORF", OracleDbType.NVarchar2).Value = PACTORF;
                cmd.Parameters.Add("PACTORL", OracleDbType.NVarchar2).Value = PACTORL;
                cmd.Parameters.Add("PNATIONALITY", OracleDbType.NVarchar2).Value = PNATIONALITY;
                cmd.Parameters.Add("PDOB", OracleDbType.NVarchar2).Value = PDOB;

                cmd.Parameters.Add("PSTARS", OracleDbType.Int32).Value = PSTARS;
                cmd.Parameters.Add("PMOVIEID", OracleDbType.Int32).Value = PMOVIEID;
                cmd.Parameters.Add("PACTORID", OracleDbType.Int32).Value = PACTORID;
                cmd.Parameters.Add("PRATINGID", OracleDbType.Int32).Value = PRATINGID;


                Con.Open();
                Transaction = Con.BeginTransaction();
                cmd.Transaction = Transaction;
                cmd.ExecuteNonQuery();
                Transaction.Commit();
                Con.Close();
                return true;


            }
            catch (Exception ex)
            {

            }
            return false;
        }
    }
}