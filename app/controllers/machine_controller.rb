class MachineController < ApplicationController
  def utilize
    data = MachineMonitorAdapter.get_data
    machine_state = MachineState.new(data)
    res = {:producing => machine_state.producing_percentage, :unplanned_downtime => machine_state.unplanned_downtime_percentage, :planned_downtime => machine_state.planned_downtime_percentage}
    render :json => res
  end
end
