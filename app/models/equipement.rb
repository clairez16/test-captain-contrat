class Equipement < ApplicationRecord
  def decorate_for_form
    [id, "#{name} (Attack: +#{attack_points}, Defense: +#{defense_points})"]
  end
end
