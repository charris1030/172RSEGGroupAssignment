var app = angular.module("app", ["angularFileUpload"]);

app.controller("CreateCtrl", function(
  $scope,
  $timeout,
  $interval,
  FileUploader,
   $http
) {
  $scope.File = null;
  $scope.Model = null;
  $scope.States = [
    { Display: " Alabama", Value: "AL" },
    { Display: " Alaska", Value: "AK" },
    { Display: " Arizona", Value: "AZ" },
    { Display: " Arkansas", Value: "AR" },
    { Display: " California", Value: "CA" },
    { Display: " Colorado", Value: "CO" },
    { Display: " Connecticut", Value: "CT" },
    { Display: " Delaware", Value: "DE" },
    { Display: " Florida", Value: "FL" },
    { Display: " Georgia", Value: "GA" },
    { Display: " Hawaii", Value: "HI" },
    { Display: " Idaho", Value: "ID" },
    { Display: " Illinois", Value: "IL" },
    { Display: " Indiana", Value: "IN" },
    { Display: " Iowa", Value: "IA" },
    { Display: " Kansas", Value: "KS" },
    { Display: " Kentucky[D]", Value: "KY" },
    { Display: " Louisiana", Value: "LA" },
    { Display: " Maine", Value: "ME" },
    { Display: " Maryland", Value: "MD" },
    { Display: " Massachusetts[E]", Value: "MA" },
    { Display: " Michigan", Value: "MI" },
    { Display: " Minnesota", Value: "MN" },
    { Display: " Mississippi", Value: "MS" },
    { Display: " Missouri", Value: "MO" },
    { Display: " Montana", Value: "MT" },
    { Display: " Nebraska", Value: "NE" },
    { Display: " Nevada", Value: "NV" },
    { Display: " New Hampshire", Value: "NH" },
    { Display: " New Jersey", Value: "NJ" },
    { Display: " New Mexico", Value: "NM" },
    { Display: " New York", Value: "NY" },
    { Display: " North Carolina", Value: "NC" },
    { Display: "  North Dakota", Value: "ND" },
    { Display: " Ohio", Value: "OH" },
    { Display: " Oklahoma", Value: "OK" },
    { Display: " Oregon", Value: "OR" },
    { Display: " Pennsylvania[F]", Value: "PA" },
    { Display: " Rhode Island[G]", Value: "RI" },
    { Display: " South Carolina", Value: "SC" },
    { Display: " South Dakota", Value: "SD" },
    { Display: " Tennessee", Value: "TN" },
    { Display: " Texas", Value: "TX" },
    { Display: " Utah", Value: "UT" },
    { Display: " Vermont", Value: "VT" },
    { Display: " Virginia", Value: "VA" },
    { Display: " Washington", Value: "WA" },
    { Display: " West Virginia", Value: "WV" },
    { Display: " Wisconsin", Value: "WI" },
    { Display: " Wyoming", Value: "WY" }
  ];

   $scope.Upload = function(F)
  {
    console.log(F);
    uploader.queue[0].upload();
    
  }
  var uploader = $scope.uploader =  new FileUploader({
   url:"/",
   method:"POST"
  });

  uploader.filters.push({
    name: "customFilter",
    fn: function(item /*{File|FileLikeObject}*/, options) {
      return this.queue.length < 2;
    }
  });

  uploader.onWhenAddingFileFailed = function(
    item /*{File|FileLikeObject}*/,
    filter,
    options
  ) {
    console.info("onWhenAddingFileFailed", item, filter, options);
  };
  uploader.onAfterAddingFile = function(fileItem) {
    console.info("onAfterAddingFile", fileItem);
    $scope.File = fileItem._file;
  };
  uploader.onSuccessItem = function(fileItem, response, status, headers) {
    console.log("Success");
      var filename = $scope.File.name;
     $scope.Messages =filename +" uploaded correctly!";
    $scope.Model = null;
    $scope.File = null;   
    uploader.clearQueue();
  };
});

app.controller("Ctrl", function($scope, $timeout, $interval) {
  $scope.CurrScreen = "About";

  $scope.ChangeScreen = function(Screen) {
    switch (Screen) {
      case "Splash":
      case "splash":
        $scope.CurrScreen = "Splash";
        return;
 case "About":
        $scope.CurrScreen = "About";
        return;
      case "Add":
      case "Create":
        $scope.CurrScreen = "Create";
        return;
      case "View":
      case "List":
        $scope.CurrScreen = "List";
        return;
    }
  };
});

 /**
    * The ng-thumb directive
    * @author: nerv
    * @version: 0.1.2, 2014-01-09
    */
    app.directive('ngThumb', ['$window', function($window) {
        var helper = {
            support: !!($window.FileReader && $window.CanvasRenderingContext2D),
            isFile: function(item) {
                return angular.isObject(item) && item instanceof $window.File;
            },
            isImage: function(file) {
                var type =  '|' + file.type.slice(file.type.lastIndexOf('/') + 1) + '|';
                return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
            }
        };

        return {
            restrict: 'A',
            template: '<canvas/>',
            link: function(scope, element, attributes) {
                if (!helper.support) return;

                var params = scope.$eval(attributes.ngThumb);

                if (!helper.isFile(params.file)) return;
                if (!helper.isImage(params.file)) return;

                var canvas = element.find('canvas');
                var reader = new FileReader();

                reader.onload = onLoadFile;
                reader.readAsDataURL(params.file);

                function onLoadFile(event) {
                    var img = new Image();
                    img.onload = onLoadImage;
                    img.src = event.target.result;
                }

                function onLoadImage() {
                    var width = params.width || this.width / this.height * params.height;
                    var height = params.height || this.height / this.width * params.width;
                    canvas.attr({ width: width, height: height });
                    canvas[0].getContext('2d').drawImage(this, 0, 0, width, height);
                }
            }
        };
    }]);
