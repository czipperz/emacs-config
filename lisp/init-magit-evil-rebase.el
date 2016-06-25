(add-hook 'git-rebase-mode-hook
          '(lambda () (interactive)
             (local-set-key (kbd "u") 'git-rebase-undo)))

(provide 'init-magit-evil-rebase)
