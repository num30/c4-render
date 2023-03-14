# c4-render
Github action to render markdown files from C4 diagrams written in DSL 

## How to use 

- Create a [DSL](https://github.com/structurizr/dsl/blob/master/docs/cookbook/README.md) file 
- Add C4-render step to github workflow
```
      - name: Run a one-line script    
        uses: num30/c4-render@1e3595a78a67ee5a2d7889aa3970bcfbea7b7dec
        with:
          path: diagrams #target path in the repository
          filename: diagram.dsl
```

Refer to this example: https://github.com/DenisPalnitsky/c4-rendering-sample/blob/main/README.md


### Parameters
```
  filename: 
    description: 'Diagram file name'
    required: true

  github-branch: 
    description: 'Github branch name to commit rendered diagrams'
    default: ${{ github.ref }}
    
  github-token:  
    description: "Github token to access target repository"    
    default: ${{ github.token }}

  github-repo:  
    description: > 
          Target repository with owner in form of `some-org/repo` 
    default: ${{ github.repository }}

  path:
    description: 'Relative path in target repository to place the rendered MD files'
    default: './'

  github-username:  
    description: "Username of a user that will make a commit`"
    default: C4RenderBot

  github-user-mail:  
    description: "Email of a user that will make a commit`"    
    default: 'github-bot@${{ github.repository_owner }}.com'
  
  structurizr-image-tag:
    description: Specific image tag of `structurizr/cli` docker image
    default:  latest
```
