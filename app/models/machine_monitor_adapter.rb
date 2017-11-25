#MachineMonitor is adapter for getting data. Source can be anything.
class MachineMonitorAdapter
  def self.get_data
    JSON.parse(File.read(Rails.root.to_s+"/config/machine_updates.json"))
  end
end
