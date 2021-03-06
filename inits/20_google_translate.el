;;; google-translate.el -- google translate

(require 'google-translate)

;; auto set source lang and target lang
(defun google-translate-enja-or-jaen (&optional string)
  (interactive)
  (setq string
	(cond ((stringp string) string)
	      (current-prefix-arg
	       (read-string "Google Translate: "))
	      ((use-region-p)
	       (buffer-substring (region-beginning) (region-end)))
	      (t
	       (thing-at-point 'word))))
  (let* ((asciip (string-match
		  "[a-zA-Z]"
		  string)))
    (run-at-time 0.1 nil 'deactivate-mark)
    (google-translate-translate
     (if asciip "en" "ja")
     (if asciip "ja" "en")
     string)))

(global-set-key (kbd "C-c t") 'google-translate-enja-or-jaen)
(global-set-key (kbd "C-c C-t") 'google-translate-query-translate)

;;; init-google-translate.el ends here
