module Autocircle
  DEFAULT_CONFIGURATION = {
    'version' => 2.1,
    'orbs' => {},
    'jobs' =>  {
      'build' =>  {
        'docker' => [],
        'steps' =>  ["checkout"]
      }
    },
    'workflows' =>  {
      'build' =>  {
        'jobs' =>  [
          {
            'build' =>  {
              'filters' =>  {
                'branches' =>  {
                  'only' =>  [
                    "/pull-req\/.*/",
                    "/release\/.*/",
                    "/hotfix\/.*/"
                  ]
                }
              }
            }
          }
        ]
      }
    }
  }
end
