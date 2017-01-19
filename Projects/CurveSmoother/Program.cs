using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;

namespace CurveSmoother
{
	class MainClass
	{
		static List<List<string>> matrix = new List<List<string>>();

		public static void MakeMatrix() {
			
			StreamReader reader = new StreamReader(File.OpenRead(Directory.GetCurrentDirectory() + @"/Program.csv"));

			bool isFirst = true;

			while (!reader.EndOfStream)
			{
				var line = reader.ReadLine();
				var values = line.Split('\t');

				if (isFirst)
				{
					foreach (string val in values)
					{
						matrix.Add(new List<string>());
					}

				}

				for (int i = 0; i < values.Length; i++)
				{
					matrix.ElementAt(i).Add(values[i]);
				}

				isFirst = false;
			}
		}

		// Minimise all changes to less than 3%
		public static void Iterate() {

			foreach (List<string> column in matrix)
			{

				double sqDiff = AbsoluteDifference(column);
				double maxDiff = 0.02;

				Console.WriteLine("Sq difference: " + sqDiff);

				for (int i = 0; i < column.Count - 1; i++) {

					double nextDistance = Double.Parse(column.ElementAt(i)) - Double.Parse(column.ElementAt(i + 1));
					Console.WriteLine("Percentage difference: " + nextDistance);
					Console.WriteLine(column.ElementAt(i) + " : " + column.ElementAt(i + 1));
					if (nextDistance > sqDiff * 0.375) {
						// moderate change to ±3% with ±0.5% random flux
						column[i + 1] = Moderate(-maxDiff, Double.Parse(column[i])).ToString();
					}

					if (nextDistance < sqDiff * 0.375 * -1) {
						column[i + 1] = Moderate(maxDiff, Double.Parse(column[i])).ToString();
					}
				}
			}
		}

		public static double AbsoluteDifference(List<string> column) {
			
			double mean = 0;

			foreach (string c in column) {
				mean += Double.Parse(c);
			}

			mean = mean / column.Count;

			Console.WriteLine("Mean is " + mean);

			double sum = 0;
			foreach (string c in column) {
				double val = (Double.Parse(c) - mean);
				sum += val * val;
			}

			return Math.Sqrt(sum / column.Count);

		}

		public static double Moderate(double maxDifference, double value) {
			return value * (1 + maxDifference + RandomNumber(-0.01, 0.01));
		}

		public static double RandomNumber(double min, double max) {
			return new Random().NextDouble() * (max - min) + min;
		}

		public static void PrintColumnNumber(int index) {
			foreach (string s in matrix.ElementAt(index)) {
				Console.WriteLine(s);
			}
		}

		public static void PrintMatrix() {
			
			StreamWriter writer = new StreamWriter(Directory.GetCurrentDirectory() + @"/output.txt");

			for (int i = 0; i < matrix.ElementAt(0).Count; i++)
			{
				string formatter = String.Empty;
				for (int j = 0; j < matrix.Count; j++){
					formatter += matrix[j][i] + "\t";
				}
			    Console.WriteLine(formatter);
				writer.WriteLine(formatter);
			}
			writer.Close();
		}

		public static void Main(string[] args)
		{
			Console.WriteLine("Hello World!");
			MakeMatrix();
			Iterate();
			PrintMatrix();
		}
	}
}
