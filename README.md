# Pre-work - Tip Calculator

Tip Calculator is a tip calculator application for iOS.

Submitted by: Megan

Time spent: 4.5 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] App is divided between screens 
* [x] Data is stored using UserDefaults and persists between pages allowing for a last used
      tip amount feature
* [x] Recommendation system implemented so that users can decide tip amount based on service
* [x] App can be used on any iPhone device as the elements auto-adjust to fit any screen


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/65MYQkf.gif' Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

For the original app, I had a hard time with the formatting in the beginning. The XCODE simulation would
show the display being cut off, which was not consistant with the storyboard image. This was because
there was a discrepency between the version I was designing on and testing on, which inspired me to format
the features so that they would scale to any iPhone screen size. After I finished the basic app I wanted
to add a feature to help answer the question of how much to tip -- something that I struggle with. This
is why I introduced the recommendation feature, which allows users to select tip amount by considering
the service on a 1-5 star rating system instead of a simple percent, if they so choose. 

## License

    Copyright @2017 Megan Marie Wang

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
