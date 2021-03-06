/*
 * Copyright 2018 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "GoogleDataTransport/GDTCORLibrary/Private/GDTCORRegistrar_Private.h"
#import "GoogleDataTransport/GDTCORLibrary/Public/GoogleDataTransport/GDTCORRegistrar.h"

NS_ASSUME_NONNULL_BEGIN

/** Testing-only methods for GDTCORRegistrar. */
@interface GDTCORRegistrar (Testing)

/** Resets the properties of the singleon, but does not reallocate a new singleton. */
- (void)reset;

@end

NS_ASSUME_NONNULL_END
