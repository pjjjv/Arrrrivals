library app_bootstrap;

import 'package:polymer/polymer.dart';

import 'package:core_elements/core_header_panel.dart' as i0;
import 'package:core_elements/core_toolbar.dart' as i1;
import 'package:core_elements/core_meta.dart' as i2;
import 'package:core_elements/core_iconset.dart' as i3;
import 'package:core_elements/core_icon.dart' as i4;
import 'package:core_elements/core_icons.dart' as i5;
import 'package:core_elements/core_icon_button.dart' as i6;
import 'package:core_elements/core_input.dart' as i7;
import 'package:paper_elements/paper_input.dart' as i8;
import 'package:paper_elements/paper_focusable.dart' as i9;
import 'package:paper_elements/paper_ripple.dart' as i10;
import 'package:paper_elements/paper_shadow.dart' as i11;
import 'package:paper_elements/paper_button.dart' as i12;
import 'package:paper_elements/paper_icon_button.dart' as i13;
import 'package:paper_elements/paper_fab.dart' as i14;
import 'package:paper_elements/paper_item.dart' as i15;
import 'arrrrivals.html.1.dart' as i16;
import 'package:core_elements/core_xhr_dart.dart' as i17;
import 'package:core_elements/core_ajax_dart.dart' as i18;
import 'arrrrivals.html.2.dart' as i19;
import 'arrrrivals.html.3.dart' as i20;
import 'arrrrivals.html.0.dart' as i21;
import 'package:smoke/smoke.dart' show Declaration, PROPERTY, METHOD;
import 'package:smoke/static.dart' show useGeneratedCode, StaticConfiguration;
import 'package:core_elements/core_xhr_dart.dart' as smoke_0;
import 'package:polymer/polymer.dart' as smoke_1;
import 'package:core_elements/core_ajax_dart.dart' as smoke_2;
import 'package:observe/src/metadata.dart' as smoke_3;
import 'arrrrivals.html.2.dart' as smoke_4;
abstract class _M0 {} // PolymerElement & ChangeNotifier

void main() {
  useGeneratedCode(new StaticConfiguration(
      checkedMode: false,
      getters: {
        #arrival: (o) => o.arrival,
        #arrivals: (o) => o.arrivals,
        #arrivalsLoaded: (o) => o.arrivalsLoaded,
        #auto: (o) => o.auto,
        #autoChanged: (o) => o.autoChanged,
        #blurAction: (o) => o.blurAction,
        #body: (o) => o.body,
        #contentType: (o) => o.contentType,
        #contextMenuAction: (o) => o.contextMenuAction,
        #disabled: (o) => o.disabled,
        #downAction: (o) => o.downAction,
        #error: (o) => o.error,
        #flight: (o) => o.flight,
        #focusAction: (o) => o.focusAction,
        #from: (o) => o.from,
        #handleAs: (o) => o.handleAs,
        #headers: (o) => o.headers,
        #icon: (o) => o.icon,
        #iconSrc: (o) => o.iconSrc,
        #inputChangeAction: (o) => o.inputChangeAction,
        #inputValue: (o) => o.inputValue,
        #invalid: (o) => o.invalid,
        #label: (o) => o.label,
        #method: (o) => o.method,
        #mode: (o) => o.mode,
        #multiline: (o) => o.multiline,
        #params: (o) => o.params,
        #paramsChanged: (o) => o.paramsChanged,
        #placeholder: (o) => o.placeholder,
        #raisedButton: (o) => o.raisedButton,
        #remarks: (o) => o.remarks,
        #response: (o) => o.response,
        #rows: (o) => o.rows,
        #scroll: (o) => o.scroll,
        #src: (o) => o.src,
        #time: (o) => o.time,
        #transitionEndAction: (o) => o.transitionEndAction,
        #upAction: (o) => o.upAction,
        #url: (o) => o.url,
        #urlChanged: (o) => o.urlChanged,
        #withCredentials: (o) => o.withCredentials,
        #z: (o) => o.z,
      },
      setters: {
        #arrivals: (o, v) { o.arrivals = v; },
        #auto: (o, v) { o.auto = v; },
        #body: (o, v) { o.body = v; },
        #contentType: (o, v) { o.contentType = v; },
        #handleAs: (o, v) { o.handleAs = v; },
        #headers: (o, v) { o.headers = v; },
        #icon: (o, v) { o.icon = v; },
        #iconSrc: (o, v) { o.iconSrc = v; },
        #inputValue: (o, v) { o.inputValue = v; },
        #method: (o, v) { o.method = v; },
        #params: (o, v) { o.params = v; },
        #response: (o, v) { o.response = v; },
        #src: (o, v) { o.src = v; },
        #url: (o, v) { o.url = v; },
        #withCredentials: (o, v) { o.withCredentials = v; },
        #z: (o, v) { o.z = v; },
      },
      parents: {
        smoke_4.ArrivalsService: _M0,
        smoke_2.CoreAjax: _M0,
        smoke_0.CoreXhr: smoke_1.PolymerElement,
        _M0: smoke_1.PolymerElement,
      },
      declarations: {
        smoke_4.ArrivalsService: {
          #arrivals: const Declaration(#arrivals, dynamic, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_1.published]),
        },
        smoke_2.CoreAjax: {
          #auto: const Declaration(#auto, bool, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_1.published]),
          #autoChanged: const Declaration(#autoChanged, Function, kind: METHOD),
          #body: const Declaration(#body, String),
          #contentType: const Declaration(#contentType, String),
          #handleAs: const Declaration(#handleAs, String, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_1.published]),
          #headers: const Declaration(#headers, Map, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_1.published]),
          #method: const Declaration(#method, String, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_1.published]),
          #params: const Declaration(#params, String, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_1.published]),
          #paramsChanged: const Declaration(#paramsChanged, Function, kind: METHOD),
          #response: const Declaration(#response, dynamic, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_1.published]),
          #url: const Declaration(#url, String, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_1.published]),
          #urlChanged: const Declaration(#urlChanged, Function, kind: METHOD),
          #withCredentials: const Declaration(#withCredentials, bool),
        },
        smoke_0.CoreXhr: const {},
      },
      names: {
        #arrival: r'arrival',
        #arrivals: r'arrivals',
        #arrivalsLoaded: r'arrivalsLoaded',
        #auto: r'auto',
        #autoChanged: r'autoChanged',
        #blurAction: r'blurAction',
        #body: r'body',
        #contentType: r'contentType',
        #contextMenuAction: r'contextMenuAction',
        #disabled: r'disabled',
        #downAction: r'downAction',
        #error: r'error',
        #flight: r'flight',
        #focusAction: r'focusAction',
        #from: r'from',
        #handleAs: r'handleAs',
        #headers: r'headers',
        #icon: r'icon',
        #iconSrc: r'iconSrc',
        #inputChangeAction: r'inputChangeAction',
        #inputValue: r'inputValue',
        #invalid: r'invalid',
        #label: r'label',
        #method: r'method',
        #mode: r'mode',
        #multiline: r'multiline',
        #params: r'params',
        #paramsChanged: r'paramsChanged',
        #placeholder: r'placeholder',
        #raisedButton: r'raisedButton',
        #remarks: r'remarks',
        #response: r'response',
        #rows: r'rows',
        #scroll: r'scroll',
        #src: r'src',
        #time: r'time',
        #transitionEndAction: r'transitionEndAction',
        #upAction: r'upAction',
        #url: r'url',
        #urlChanged: r'urlChanged',
        #withCredentials: r'withCredentials',
        #z: r'z',
      }));
  configureForDeployment([
      i0.upgradeCoreHeaderPanel,
      i1.upgradeCoreToolbar,
      i2.upgradeCoreMeta,
      i3.upgradeCoreIconset,
      i4.upgradeCoreIcon,
      i6.upgradeCoreIconButton,
      i7.upgradeCoreInput,
      i8.upgradePaperInput,
      i9.upgradePaperFocusable,
      i10.upgradePaperRipple,
      i11.upgradePaperShadow,
      i12.upgradePaperButton,
      i13.upgradePaperIconButton,
      i14.upgradePaperFab,
      i15.upgradePaperItem,
      () => Polymer.register('core-xhr-dart', i17.CoreXhr),
      () => Polymer.register('core-ajax-dart', i18.CoreAjax),
      () => Polymer.register('arrivals-service', i19.ArrivalsService),
    ]);
  i21.main();
}
