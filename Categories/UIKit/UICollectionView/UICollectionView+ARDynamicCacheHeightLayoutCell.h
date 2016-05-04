// The MIT License (MIT)
//
// Copyright (c) 2015
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//https://github.com/AugustRush/UICollectionView-ARDynamicHeightLayoutCell
#import <UIKit/UIKit.h>

@interface UICollectionView (ARDynamicCacheHeightLayoutCell)

/**
 *  caculate cell size
 *
 *  @param identifier    cell's reuse identifier
 *  @param indexPath     indexPath
 *  @param configuration fill cell with you feed data
 *
 *  @return the caculated cell's height
 */
- (CGSize)ar_sizeForCellWithIdentifier:(NSString *)identifier
                             indexPath:(NSIndexPath *)indexPath
                         configuration:
                             (void (^)(__kindof UICollectionViewCell *))
                                 configuration;

/**
 *  caculate cell size with a fixed width
 *
 *  @param identifier    cell's reuse identifier
 *  @param indexPath     indexPath
 *  @param fixedWidth    your expect width
 *  @param configuration fill cell with you feed data
 *
 *  @return the caculated cell's height
 */

- (CGSize)ar_sizeForCellWithIdentifier:(NSString *)identifier
                             indexPath:(NSIndexPath *)indexPath
                            fixedWidth:(CGFloat)fixedWidth
                         configuration:
                             (void (^)(__kindof UICollectionViewCell *cell))
                                 configuration;

/**
 *  caculate cell size with fixed height
 *
 *  @param identifier    cell's reuse identifier
 *  @param indexPath     indexPath
 *  @param fixedWidth    your expect height
 *  @param configuration fill cell with you feed data
 *
 *  @return the caculated cell's height
 */

- (CGSize)ar_sizeForCellWithIdentifier:(NSString *)identifier
                             indexPath:(NSIndexPath *)indexPath
                           fixedHeight:(CGFloat)fixedHeight
                         configuration:
                             (void (^)(__kindof UICollectionViewCell *cell))
                                 configuration;

@end
