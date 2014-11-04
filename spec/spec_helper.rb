require 'record_manager'

def test_records
  [ 
    RecordManager::Record.new(*%W(Simpson Homer Male White 05-12-1955)),
    RecordManager::Record.new(*%W(Bouvier Selma Female Blue  01-24-1958)),
    RecordManager::Record.new(*%W(Muntz Nelson Male Orange 07-28-1989)),
    RecordManager::Record.new(*%W(Szyslak Moe Male Gray 11-20-1949)),
    RecordManager::Record.new(*%W(Krabappel Edna Female Green 09-19-1960))
  ]
end