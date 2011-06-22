require({
  paths: { "text": "lib/text" },
  packagePaths: { "lib": [
      { name: "gcli", main: "index", lib: "." } ]}});

require(['gcli/index'],
  function(gcli) {
    try {
      gcli.startup();
      gcli.createView();

      $.getJSON('thor-metadata.json', function(json) {
        json.cmds.forEach(function(cmd) {
          cmd.exec = function(args, env) {
            return 'hi';
          };
          gcli.addCommand(cmd);
        });
      });
    } catch (ex) {
      console.error(ex);
    }
});
