class UITouch

  def to_s
    phase = case self.phase
            when UITouchPhaseBegan
              'began'
            when UITouchPhaseMoved
              'moved'
            when UITouchPhaseStationary
              'stationary'
            when UITouchPhaseEnded
              'ended'
            when UITouchPhaseCancelled
              'cancelled'
            end
    "#{self.class.to_s}(#{self.tapCount} #{self.tapCount == 1 ? 'tap' : 'taps'}, phase: #{phase}, "\
                      "at #{self.locationInView(self.view).inspect}, @ #{self.timestamp})"
  end

end