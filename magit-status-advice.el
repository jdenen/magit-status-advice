;;; magit-status-advice.el --- Version control pleasantry as a minor mode -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Johnson Denen
;;
;; Author: Johnson Denen <https://github.com/jdenen>
;; Maintainer: Johnson Denen <johnson.denen@gmail.com>
;; Created: April 29, 2020
;; Modified: April 29, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/jdenen/magit-status-advice
;; Package-Requires: ((emacs 26.2) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Version control pleasantry as a minor mode.
;;
;;  Inspired by (and largely paraphrased from) https://kk.org/thetechnium/68-bits-of-unsolicited-advice/.
;;
;;; Code:
(defgroup magit-status-advice nil
  "Advice and encouragement every time you invoke `magit-status'."
  :prefix "magit-status-advice"
  :group 'external)

(defcustom magit-status-advice-list
  '("Being enthusiastic is worth 25 IQ points." "Learn how to learn from those you disagree with."
    "Always demand a deadline." "Don't make it perfect; make it different." "There is no 'them.'"
    "Don't be afraid to ask a question that may sound stupid." "You can get better at gratitude."
    "Gratitude will unlock all other virtues." "Don't trust all-purpose glue."
    "Pros are just amateurs gracefully recovering from their mistakes." "Everyone is shy. Go ahead."
    "A little nonsense now and then is relished by the wisest men." "Take a break."
    "Extraordinary claims require extraordinary evidence." "Don't be the smartest person in the room."
    "Don't take it personally when someone turns you down." "To be interesting, be interested."
    "Optimize for generosity." "To make something great: re-do it, re-do it, re-do it."
    "Promptness is a sign of respect." "Habit is to remove an action from self-negotiation."
    "If you mess up, fess up." "Ownership is powerful." "Never get involved in a land war in Asia."
    "Show up and keep showing up." "Edit after creation, not during." "You are what you do."
    "There's no limit on better." "No problems, no progress." "Art is in what you leave out."
    "Never play cards with a guy whose first name is also a city." "A laugh can be a very powerful thing."
    "Before agreeing to a thing in the future, would you agree to do it tomorrow?"
    "All we have to decide is what to do with the time that is given to us."
    "Apologize quickly, specifically, sincerely." "Urgency is often a disguise."
    "Eliminating clutter makes room for what matters." "You REALLY don't want to be famous."
    "Master something, anything." "The long term is decided by optimists." "Don't be in debt to losers."
    "In 100 years, what you believe will probably be demonstrably false." "Fear is the mindkiller."
    "It's such a fine line between stupid and clever.")
  "Sayings and tidbits of advice/encouragement to display after `magit-status' invocation."
  :group 'magit-advice
  :type '(repeat string))

(defun magit-status-advice-message (&rest _args)
  "Message random element in `magit-advice-list', ignoring ARGS."
  (let ((index (random (length magit-status-advice-list))))
    (message (nth index magit-status-advice-list))))

(define-minor-mode magit-status-advice-mode
  "Minor mode to message advice/encouragement after invoking `magit-status'."
  :group 'magit-advice
  :global t
  (cond (magit-status-advice-mode (advice-add 'magit-status :after #'magit-status-advice-message))
        (t (advice-remove 'magit-status #'magit-status-advice-message))))

(provide 'magit-status-advice)
;;; magit-status-advice.el ends here
