﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Projeto_da_Biblioteca
{
    public partial class Telauser : Form
    {
        public Telauser()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Autenticacao Autenticacao = new Autenticacao();
            Autenticacao.Show();

            this.Close();
        }

        private void Telauser_Load(object sender, EventArgs e)
        {

        }
    }
}