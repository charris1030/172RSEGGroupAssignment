
<div id="LogoWrapper"> 
  
  <ul id="LogoNames">
    <li ng-click="ChangeScreen('Splash')">Home</li>
    <li  ng-click="ChangeScreen('Create')">Upload</li>
    <li  ng-click="ChangeScreen('List')">View</li>
  </ul>
</div>


<div class="wrapper" ng-if="CurrScreen=='Splash'">
  <h2>Lets Make Things</h2>
  <p>  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse rhoncus mauris non urna commodo consectetur. Etiam vel venenatis eros. Maecenas malesuada erat at pretium eleifend. Phasellus dignissim facilisis elit. Pellentesque blandit est non ante mattis, nec volutpat tortor venenatis. Fusce suscipit lacinia posuere. Integer gravida fermentum felis a tempus. Aliquam erat volutpat. Donec est augue, ullamcorper dictum enim pellentesque, egestas tempor ante. Maecenas sit amet accumsan ex.

</p>
  <a class="button">Lets Start</a>
</div>

<div class="wrapper" ng-if="CurrScreen=='Create'">
  <h2>Lets Add Things</h2>
  <p>
    This is a form that will allow you to add things.
  </p>
  <div class="inputwrapper">  
    <input type="text" placeholder="First Name"/>
    <input type="text" placeholder="Last Name"/>
    <input type="text" placeholder="Doctor Name"/>
    <input type="text" placeholder="SSN"/>
    <br/>
    <input type="text" placeholder="Address"/>
    <input type="text" placeholder="City"/>
    <input type="text" placeholder="State"/>
    <select ng-model="Item" ng-options="P.Value as P.Display for P in States"></select>
    
</div>
  <a class="button">Lets Upload</a>
</div>

