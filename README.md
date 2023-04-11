# m-design-system
Nesse projeto em Swift, optei por fazer um framework chamado Design System, usando o SPM e integrando-o a um projeto Sample. Além disso, utilizei scripts para gerar os tipos concretos do tokens a partir do json(dentro da pasta Resources) que foi disponibilizado. Como já tinha atuando um pouco com Design System, procurei essa abordagem para aprender um outro jeito de fazer essas classes, evitando fazer uma a uma na mão. Foi um desafio legal (um pouco trabalhoso rs), mas serviu de aprendizado. Tais scripts se encontram no arquivo TokensGenerator.swift. 

Embora eu tenha usado os scripts, umas duas classes fiz na mão. Para gerar as classes com os tokens, configurei um pre-action nas configurações do schema de buil do framework, dessa forma basta buildar o projeto que as classes serão geradas e ficarão na pasta Tokens dentro de Sources. 

Os componentes de layout estão na pasta Components: PrimaryButton, BaseLabel, CardContent, Shape. Para estes, fiz teste de snapshots porque ficava mais fácil de ir validando conforme ia desenvolvendo, além de garantir que não houvesse mudanças inesperadas. Para roda-los, basta pressionar cmd+u. As imagens ficam na pasta Tests/DesignSystemTests/__Snapshots__/design_systemTests. Utilizei a lib swift-snapshot-testing. 

OBS: alguns tokens no json estão diferentes em relação ao figma. Por exemplo: algumas cores do Neutral estão “invertidas”, a 1 do figma é a 5 no json. Priorizei deixar o mais parecido com figma, por isso que em algumas partes do código o token não é mesmo do que está descrito no componente no figma. 


Em relação a pontos de melhorias, cito alguns:
- [ ]  Ver uma forma de otimizar/diminuir o arquivo de scripts. Com tantos tokens ele ficou grande, um pouco complicado de entender, o que pode comprometer sua manutenção, vale avaliar se compensa manter
- [ ] A forma utilizada para fazer o padding funciona, mas acredito que não seja a ideal. Utilizar layoutMargins, ou algo relacionado ao frame/bounds da view pode ser mais assertivo. 
- [ ] Rever o cálculo do lineHeight no Swift, pois a versão do figma em comparação com o simulador/teste apresentava uma leve diferença 
