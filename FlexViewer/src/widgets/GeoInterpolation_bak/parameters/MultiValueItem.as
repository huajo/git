///////////////////////////////////////////////////////////////////////////
// Copyright (c) 2011 Esri. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
///////////////////////////////////////////////////////////////////////////
package widgets.GeoInterpolation.parameters
{
	import mx.collections.ArrayCollection;

	public class MultiValueItem
	{
		public var item:String;
		public var selected:Boolean;
		public var item2:String;//备用字段
		
		//添加属性，是否是地统计插值
		public var isGeoInterpolation:Boolean;
		
		//添加一个属性，表示参数集合
		private var _params:ArrayCollection;
		
		public function get params():ArrayCollection
		{
			return _params;
		}
		
		public function set params(value:ArrayCollection):void
		{
			_params = value;
		}
		
		public function MultiValueItem(item:String,item2:String="", params:ArrayCollection=null,isGeoInterpolation:Boolean=false,selected:Boolean = false)
		{
			this.item = item;
			this.item2= item2;
			this.selected = selected;
			this.params = params;
			this.isGeoInterpolation = isGeoInterpolation;
		}
	}
}
