user = getenv('USER');      % User you want to send the email to.
domain = getenv('DOMAIN');  % The domain name of the user. (May need to setenv DOMAIN in .bashrc)
host = getenv('HOST');      % Computer name

fprintf('File genData.m in:\n\n');
fprintf('   %s.\n\n', pwd);
fprintf('%s has the following specs\n', host);
specs = cpuinfo();
display(specs);
fprintf('Running...\n\n');

genData;

fprintf('\nDone.\n')

email = sprintf('%s@%s', user, domain);
subject = 'Matlab process is done';
message = sprintf('The Matlab process in %s has finished running genData.m. See matlablog.txt for details.', host);
command = sprintf('echo %s | /bin/mail -s "%s" -a "matlablog.txt" "%s"', message, subject, email);
system(command);

exit();
