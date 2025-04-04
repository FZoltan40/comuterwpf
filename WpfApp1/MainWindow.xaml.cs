using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            ReadComputer();
        }
        private const string ConnectionString = "Server=localhost;Database=computer;Uid=root; Password=password;SslMode=None";
        private void opRendszer_Click(object sender, RoutedEventArgs e)
        {
            ReadOs();
        }

        private void computer_Click(object sender, RoutedEventArgs e)
        {
            ReadComputer();
        }

        private void ReadComputer()
        {
            try
            {
                using (var connection = new MySqlConnection(ConnectionString))
                {
                    string sql = "SELECT * FROM `comp`";

                    connection.Open();
                    using (var da = new MySqlDataAdapter(sql, connection))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        dataGrid.ItemsSource = dt.DefaultView;
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }

        }

        private void ReadOs()
        {
            try
            {
                using (var connection = new MySqlConnection(ConnectionString))
                {
                    string sql = "SELECT * FROM `osystem`";

                    connection.Open();
                    using (var da = new MySqlDataAdapter(sql, connection))
                    {

                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        dataGrid.ItemsSource = dt.DefaultView;



                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }

        }
    }
}
