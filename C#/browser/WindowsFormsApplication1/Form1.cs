using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            this.Text = "MyBrowser";
            this.comboBox1.Text = "http://ch1.chaberi.com/chat/blue/19";
        }

        private void comboBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                try
                {
                    string url = comboBox1.Text;
                    if (!comboBox1.Text.StartsWith("http://")) url = "http://" + url;
                    webBrowser1.Navigate(new Uri(url));
                    comboBox1.Items.Add(url);
                }
                catch
                {
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                webBrowser1.Navigate(comboBox1.Text);
            }
            catch
            {
            }
        }

        private void webBrowser1_Navigated(object sender, WebBrowserNavigatedEventArgs e)
        {
            this.Text = webBrowser1.Document.Title.ToString() + " - MyBrower";
            this.comboBox1.Text = webBrowser1.Url.ToString();
        }
    }
}
