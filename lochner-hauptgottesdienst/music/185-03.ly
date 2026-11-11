\version "2.24.3"
% Scan 185, printed p. 160: Festival Alleluia b, Preußische Kirchenordnung 1558.
% The lower final chord is blot-darkened. Provisional reading F-sharp3 and D3.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}


\score {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble \key d \major \time 4/4 \cadenzaOn
        \new Voice = "sung" { \voiceOne fis'2 a'2 \bar "|" b'2 a'2 \bar "|"
          d''4( cis''4 b'4) a'4 \bar "|" b'2 g'2 \bar "|"
          a'2 fis'4( g'4) \bar "|" fis'2( e'2) \bar "|"
          \once \override NoteColumn.force-hshift = #-0.6 d'1 \bar "|." }
        \new Voice { \voiceTwo d'2 fis'2 g'2 fis'2 fis'4.( e'8 d'4) fis'4
          g'2 g'2 fis'2 d'4( b4) d'2.( cis'4)
          \once \override NoteColumn.force-hshift = #0.6 d'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "Hal :" "le :" "lu :" "ja!"
        "Hal : :" \skip 1 \skip 1 "le :" "lu :" "ja!"
        "Hal :" "le : :" \skip 1 "lu : : :" \skip 1 "ja!"
      }
      \new Staff <<
        \clef bass \key d \major \time 4/4 \cadenzaOn
        \new Voice { \voiceOne a2 d'2 d'2 d'2 d'4( a4 b4) d'4
          d'2 b2 d'2 a4( g4) a1 fis1 }
        \new Voice { \voiceTwo d2 d2 g2 d2 d4( fis4 g4) d4
          g2 g2 d2 d4( e4) d2( a,2) d1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
