class Counter
    def self.calculate_percentege_complete(completed_task, total)
        return completed_task.to_f / total.to_f * 100
    end
end