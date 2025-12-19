Add-Type -AssemblyName System.Data.SQLite

$dbPath = "C:\Users\USER03012025\NavoiyDB\navoiy.db"
$connectionString = "Data Source=$dbPath;Version=3;"
$connection = New-Object System.Data.SQLite.SQLiteConnection
$connection.ConnectionString = $connectionString
$connection.Open()

$command = $connection.CreateCommand()
$command.CommandText = "SELECT w.title AS Asar, t.language AS Til, t.translator AS Tarjimon 
                        FROM works w 
                        LEFT JOIN translations t ON w.id = t.work_id;"

$reader = $command.ExecuteReader()
while ($reader.Read()) {
    Write-Host ($reader["Asar"] + " | " + $reader["Til"] + " | " + $reader["Tarjimon"])
}

$connection.Close()
